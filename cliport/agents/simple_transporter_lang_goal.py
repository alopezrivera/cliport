import numpy as np

from cliport.utils import utils

from cliport.models.streams.two_stream_attention_lang_fusion import TwoStreamAttentionLangFusionLat
from cliport.models.streams.simple_two_stream_transport_lang_fusion import SimpleTwoStreamTransportLangFusionLat

from cliport.agents.transporter_lang_goal import TwoStreamClipLingUNetTransporterAgent


class SimpleTwoStreamClipLingUNetLatTransporterAgent(TwoStreamClipLingUNetTransporterAgent):
    def __init__(self, name, cfg, train_ds, test_ds):
        super().__init__(name, cfg, train_ds, test_ds)

    def _build_model(self):
        stream_one_fcn = 'simple_plain_resnet_lat'
        stream_two_fcn = 'simple_clip_lingunet_lat'
        self.attention = TwoStreamAttentionLangFusionLat(
            stream_fcn=(stream_one_fcn, stream_two_fcn),
            in_shape=self.in_shape,
            n_rotations=1,
            preprocess=utils.preprocess,
            cfg=self.cfg,
            device=self.device_type,
        )
        self.transport = SimpleTwoStreamTransportLangFusionLat(
            stream_fcn=(stream_one_fcn, (stream_two_fcn, self.attention.attn_stream_two.clip_rn50)),
            in_shape=self.in_shape,
            n_rotations=self.n_rotations,
            crop_size=self.crop_size,
            preprocess=utils.preprocess,
            cfg=self.cfg,
            device=self.device_type,
        )
